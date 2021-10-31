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

        public IEnumerable<PitchModel> GetAllAdvisory(PitchModel filter)
        {
            var listAdvisory = _res.FindBy(x => x.Status == (int)PitchStatus.Active);

            var listAdvisoryModel = (listAdvisory.ProjectTo<PitchModel>
                (_mapper.ConfigurationProvider)).DynamicFilter(filter);

            return listAdvisoryModel.ToList();
        }

        public IEnumerable<PitchModel> getHighestRates()
        {
            var listAdvisory =  _res.FindBy(x => x.Status == (int)PitchStatus.Active);
            listAdvisory = listAdvisory.OrderByDescending(x => x.Rates).Take(3);
            return _mapper.Map<List<PitchModel>>(listAdvisory.ToList());
        }

        public IEnumerable<PitchModel> getRecommendPitch()
        {
            var listAdvisory = _res.FindBy(x => x.Status == (int)PitchStatus.Active);
            listAdvisory = listAdvisory.OrderBy(x => Guid.NewGuid()).Take(3);
            return _mapper.Map<List<PitchModel>>(listAdvisory.ToList());
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

        public async Task<bool> UpdateRatePitch(int id, double rate)
        {
            var pitch = (await _res.FindAsync(x => x.Id == id && x.Status == (int)PitchStatus.Active));
            if(pitch != null)
            {
                pitch.Rates = rate;
                await _res.UpdateAsync(pitch);
                return true;
            }
            return false;
            
        }

        public async Task<PitchModel> GetPitchById(int id)
        {
            var pitch = await _res.FindAsync(x => x.Id == id &&
            x.Status == (int)PitchStatus.Active);
            if (pitch != null)
            {
                return _mapper.Map<PitchModel>(pitch);
            }
            return null;
        }
    }
}
