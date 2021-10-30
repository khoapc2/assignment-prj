using AutoMapper;
using AutoMapper.QueryableExtensions;
using PagedList;
using PitchBooking.Business.IServices;
using PitchBooking.Business.Requests.FeedbackRequest;
using PitchBooking.Business.ViewModel;
using PitchBooking.Data.IRepositories;
using PitchBooking.Data.Models;
using Reso.Core.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace PitchBooking.Business.Services
{
    public class FeedBackService : IFeedbackService
    {
        private readonly IGenericRepository<Feedback> _res;

        private readonly IPitchService _servicePitch;
        private readonly IMapper _mapper;

        public FeedBackService(IGenericRepository<Feedback> res, IMapper mapper, IPitchService service)
        {
            _res = res;
            _mapper = mapper;
            _servicePitch = service;
        }

        public async Task<FeedBackModel> CreateAdvisory(CreateFeedbackRequest request)
        {

            var pitch = _mapper.Map<Feedback>(request);
            await _res.InsertAsync(pitch);
            await _res.SaveAsync();

            ICollection<Feedback> listFeedback = await _res.FindByAsync(x => x.PitchId == request.PitchId);
            double avg = Math.Round((double)listFeedback.Average(x => x.Rating), 1);
            bool result = await _servicePitch.UpdateRatePitch((int)request.PitchId, avg);
            if (result)
            {
               return _mapper.Map<FeedBackModel>(pitch);
            }
            return null;
            
        }

        public IEnumerable<FeedBackModel> GetAllAdvisory(FeedBackModel filter)
        {
            var listAdvisory = _res.FindBy(x => true).Include(x => x.Customer);

            var listAdvisoryModel = (listAdvisory.ProjectTo<FeedBackModel>
                (_mapper.ConfigurationProvider)).DynamicFilter(filter);           
            return listAdvisoryModel;
        }
    }
}
