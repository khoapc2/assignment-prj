using AutoMapper;
using AutoMapper.QueryableExtensions;
using PagedList;
using PitchBooking.Business.Enum;
using PitchBooking.Business.IServices;
using PitchBooking.Business.Requests.PitchRequest;
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
    public class PitchService : IPitchService
    {
        private readonly IGenericRepository<Pitch> _res;
        private readonly IMapper _mapper;
        
        public PitchService(IGenericRepository<Pitch> res, IMapper mapper)
        {
            _res = res;
            _mapper = mapper;
        }

        public IPagedList<PitchModel> GetAllAdvisory(PitchModel filter, int pageIndex,
           int pageSize)
        {
            var listAdvisory = _res.FindBy(x => x.Status == (int)PitchStatus.Active);

            var listAdvisoryModel = (IQueryable<PitchModel>)(listAdvisory.ProjectTo<PitchModel>
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
            return PagedListExtensions.ToPagedList<PitchModel>(listAdvisoryModel, pageIndex, pageSize);
        }

        public async Task<List<PitchModel>> getHighestRates()
        {
            var listAdvisory =  _res.FindBy(x => x.Status == (int)PitchStatus.Active);
            listAdvisory = listAdvisory.OrderByDescending(x => x.Rates).Take(3);
            return _mapper.Map<List<PitchModel>>(listAdvisory);
        }

        public async Task<PitchModel> CreateAdvisory(CreatePitchRequest request)
        {
            var advisory = _mapper.Map<Pitch>(request);
            advisory.Status = 1;
            await _res.InsertAsync(advisory);
            await _res.SaveAsync();
            return _mapper.Map<PitchModel>(advisory);
        }

        public async Task<PitchModel> UpdateAdvisory(int id, UpdatePitchRequest request)
        {
            var advisory = await _res.FindAsync(x => x.Id == id && x.Status == (int)PitchStatus.Active);
            if (advisory == null)
            {
                return null;
            }
            advisory = _mapper.Map(request, advisory);
            advisory.Status = 1;
            await _res.UpdateAsync(advisory);
            await _res.SaveAsync();

            return _mapper.Map<PitchModel>(advisory);
        }

        public async Task<bool> DeleteAdvisory(int id)
        {
            var advisory = (await _res.FindAsync(x => x.Id == id && x.Status == (int)PitchStatus.Active));
            if (advisory == null)
            {
                return false;
            }
            advisory.Status = 0;
            await _res.UpdateAsync(advisory);
            await _res.SaveAsync();
            return true;
        }
    }
}
