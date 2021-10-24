using AutoMapper;
using PitchBooking.Business.Requests.FeedbackRequest;
using PitchBooking.Business.ViewModel;
using PitchBooking.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.AutoMapper
{
    public class FeedbackModule : Profile
    {
        public FeedbackModule()
        {
            CreateMap<CreateFeedbackRequest, Feedback> ();
            CreateMap<Feedback, FeedBackModel>();
        }
    }
}
