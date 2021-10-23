using AutoMapper;
using PitchBooking.Business.Enum;
using PitchBooking.Business.IServices;
using PitchBooking.Business.Requests.UserAccountRequest;
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
    public class UserAccountService : IUserAccountService
    {
        private IGenericRepository<UserAccount> _genericRepository;
        private IMapper _mapper;

        public UserAccountService(IGenericRepository<UserAccount> genericRepository, IMapper mapper)
        {
            _genericRepository = genericRepository;
            _mapper = mapper;
        }

        public async Task<bool> RegisterAccount(UserAccountRequest request)
        {
            var account = await _genericRepository.FindAsync(a => a.Username.Equals(request.Username));
            if (account != null) return false;

            account = _mapper.Map<UserAccount>(request);
            account.Status = (int) UserAccountStatus.Active;
            await _genericRepository.InsertAsync(account);
            await _genericRepository.SaveAsync();
            return true;
        }

        public async Task<UserAccountModel> UpdateProfile(UserAccountRequest request)
        {
            var profile = await _genericRepository.FindAsync(a => a.Id == request.Id && a.Status == (int) UserAccountStatus.Active);
            if (profile == null) return null;

            profile.Username = request.Username;
            profile.Password = request.Password;
            profile.Name = request.Name;
            profile.Email = request.Email;
            profile.Phone = request.Phone;
            profile.Address = request.Address;
            profile.Role = request.Role;
            profile.Status = (int)UserAccountStatus.Active;
            await _genericRepository.UpdateAsync(profile);
            return _mapper.Map<UserAccountModel>(profile);
        }
    }
}
