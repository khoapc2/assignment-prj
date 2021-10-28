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
            CreateMap<SubPitch, SubPitchModel>()
                .ForMember(d => d.PitchName, s => s.MapFrom(s => s.Pitch.Name));
            CreateMap<SubPitchCreate, SubPitch>();
            CreateMap<SubPitchUpdate, SubPitch>();

            CreateMap<SubPitchCreate, SubPitchModel>();
        }
    }
}
