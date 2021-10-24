using AutoMapper;
using PitchBooking.Business.Enum;
using PitchBooking.Business.IServices;
using PitchBooking.Business.Requests.SubPitchRequest;
using PitchBooking.Business.ViewModel;
using PitchBooking.Data.IRepositories;
using PitchBooking.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.Services
{
    public class SubPitchService : ISubPitchService
    {
        private IGenericRepository<SubPitch> _genericRepository;
        private IMapper _mapper;
        public SubPitchService(IGenericRepository<SubPitch> genericRepository, IMapper mapper)
        {
            _genericRepository = genericRepository;
            _mapper = mapper;
        }

        public async Task<SubPitchModel> CreateSubPitch(SubPitchCreate subPitchCreate)
        {
            var subPitch = _mapper.Map<SubPitch>(subPitchCreate);
            await _genericRepository.InsertAsync(subPitch);
            await _genericRepository.SaveAsync();

            return _mapper.Map<SubPitchModel>(subPitch);
        }

        public async Task<bool> DeleteSubPitch(int id)
        {
            var subPitch = await _genericRepository.FindAsync(x => x.Id == id &&
            x.Status == (int)SubPitchStatus.Active);
            if (subPitch != null)
            {
                subPitch.Status = (int)SubPitchStatus.InActive;
                await _genericRepository.UpdateAsync(subPitch);
                return true;
            }
            return false;
        }

        public async Task<IEnumerable<SubPitchModel>> GetAllSubPitches()
        {
            var subPitches = await _genericRepository.FindByAsync(x => x.Status == (int)SubPitchStatus.Active);
            return _mapper.Map<IEnumerable<SubPitchModel>>(subPitches);
        }

        public async Task<SubPitchModel> GetSubPitchById(int id)
        {
            var subPitch = await _genericRepository.FindAsync(x => x.Id == id &&
            x.Status == (int)SubPitchStatus.Active);
            if (subPitch != null)
            {
                return _mapper.Map<SubPitchModel>(subPitch);
            }
            return null;
        }

        public Task<ICollection<SubPitchModel>> GetSubPitchesByPitchId(int pitchId)
        {
            throw new NotImplementedException();
        }

        public async Task<SubPitchModel> UpdateSubPitch(SubPitchUpdate subPitchUpdate)
        {
            var subPitch = await _genericRepository.FindAsync(x => x.Id == subPitchUpdate.Id &&
            x.Status == (int)SubPitchStatus.Active);
            if (subPitch != null)
            {
                subPitch = _mapper.Map(subPitchUpdate, subPitch);
                await _genericRepository.SaveAsync();
                return _mapper.Map<SubPitchModel>(subPitch);
            }
            return null;
        }

        
    }
}
