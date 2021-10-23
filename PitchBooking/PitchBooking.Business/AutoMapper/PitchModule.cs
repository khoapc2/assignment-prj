using AutoMapper;
using PitchBooking.Business.ViewModel;
using PitchBooking.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.AutoMapper
{
    
    public class PitchModule : Profile
    {
        public PitchModule()
        {
            CreateMap<Pitch, PitchModel>();
            
        }
    }
}
