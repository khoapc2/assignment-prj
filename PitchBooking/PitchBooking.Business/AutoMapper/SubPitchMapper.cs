using AutoMapper;
using PitchBooking.Business.Requests.SubPitchRequest;
using PitchBooking.Business.ViewModel;
using PitchBooking.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.AutoMapper
{
    public class SubPitchMapper : Profile
    {
       public SubPitchMapper()
        {
            CreateMap<SubPitch, SubPitchModel>();
            CreateMap<SubPitchCreate, SubPitch>();
            CreateMap<SubPitchUpdate, SubPitch>();
        }
    }
}
