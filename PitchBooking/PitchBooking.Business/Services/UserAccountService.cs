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
        private IAuthenticationService _authenticationService;

        public UserAccountService(IGenericRepository<UserAccount> genericRepository, IMapper mapper, IAuthenticationService authenticationService)
        {
            _genericRepository = genericRepository;
            _mapper = mapper;
            _authenticationService = authenticationService;
        }

        public async Task<bool> ChangePassword(ChangePasswordRequest request)
        {
            var account = await _genericRepository.FindAsync(a => a.Username.Equals(request.Username) && a.Status == (int)UserAccountStatus.Active);
            if (account == null) return false;

            account.Password = request.NewPassword;
            await _genericRepository.UpdateAsync(account);
            return true;
        }

        public async Task<bool> CheckUsername(string username)
        {
            var account = await _genericRepository.FindAsync(a => a.Username.Equals(username) && a.Status == (int)UserAccountStatus.Active);
            if (account != null) return true;
            return false;
        }

        public async Task<UserAccountModel> GetProfileByID(int id)
        {
            var profile = await _genericRepository.FindAsync(a => a.Id == id && a.Status == (int)UserAccountStatus.Active);
            return _mapper.Map<UserAccountModel>(profile);
        }

        public async Task<AuthenticationModel> Login(LoginRequest request)
        {
            var account = await _genericRepository.FindAsync(a => a.Username.Equals(request.Username) && a.Password.Equals(request.Password));
            if (account == null) return null;

            var token = _authenticationService.GenerateJSONWebToken(account.Id.ToString(), account.Username, account.Role);
            return new AuthenticationModel() { UserID = account.Id, Token = token, DisplayName = account.Name, Role = account.Role };
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

        public async Task<UserAccountModel> UpdateProfile(UpdateAccountRequest request)
        {
            var profile = await _genericRepository.FindAsync(a => a.Id == request.Id && a.Status == (int)UserAccountStatus.Active);
            if (profile == null) return null;

            profile.Status = (int)UserAccountStatus.Active;
            profile = _mapper.Map(request, profile);
            await _genericRepository.SaveAsync();
            return _mapper.Map<UserAccountModel>(profile);
        }

        
    }
}
