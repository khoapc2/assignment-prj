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

namespace PitchBooking.Business.Services
{
    public class FeedBackService : IFeedbackService
    {
        private readonly IGenericRepository<Feedback> _res;
        private readonly IMapper _mapper;

        public FeedBackService(IGenericRepository<Feedback> res, IMapper mapper)
        {
            _res = res;
            _mapper = mapper;
        }

        public async Task<FeedBackModel> CreateAdvisory(CreateFeedbackRequest request)
        {
            var advisory = _mapper.Map<Feedback>(request);
            await _res.InsertAsync(advisory);
            await _res.SaveAsync();
            return _mapper.Map<FeedBackModel>(advisory);
        }

        public IPagedList<FeedBackModel> GetAllAdvisory(FeedBackModel filter, int pageIndex,
            int pageSize)
        {
            var listAdvisory = _res.FindBy(x => true);

            var listAdvisoryModel = (listAdvisory.ProjectTo<FeedBackModel>
                (_mapper.ConfigurationProvider)).DynamicFilter(filter);
            //switch (sortBy.ToString())
            //{
            //    case "Question":
            //        if (order.ToString() == "Asc")
            //        {
            //            listAdvisoryModel = (IQueryable<AdvisoryModel>)listAdvisoryModel.OrderBy(x => x.Question);
            //        }
            //        else
            //        {
            //            listAdvisoryModel = (IQueryable<AdvisoryModel>)listAdvisoryModel.OrderByDescending(x => x.Question);
            //        }
            //        break;
            //    case "Answer":
            //        if (order.ToString() == "Asc")
            //        {
            //            listAdvisoryModel = (IQueryable<AdvisoryModel>)listAdvisoryModel.OrderBy(x => x.Answer);
            //        }
            //        else
            //        {
            //            listAdvisoryModel = (IQueryable<AdvisoryModel>)listAdvisoryModel.OrderByDescending(x => x.Answer);
            //        }
            //        break;
            //}
            return PagedListExtensions.ToPagedList<FeedBackModel>(listAdvisoryModel, pageIndex, pageSize);
        }
    }
}
