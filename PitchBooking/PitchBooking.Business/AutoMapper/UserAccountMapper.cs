using AutoMapper;
using PitchBooking.Business.Enum;
using PitchBooking.Business.Requests.UserAccountRequest;
using PitchBooking.Business.ViewModel;
using PitchBooking.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.AutoMapper
{
    public class UserAccountMapper : Profile
    {
        public UserAccountMapper()
        {
            CreateMap<UserAccount, UserAccountModel>()
                .ForMember(d => d.Status, s => s.MapFrom(s => s.Status == 1 ? UserAccountStatus.Active : UserAccountStatus.InActive));
            CreateMap<UserAccountRequest, UserAccount>()
                .ForMember(d => d.Status, s => s.MapFrom(s => (int?)s.Status));

            CreateMap<UpdateAccountRequest, UserAccount>();
        }
    }
}
