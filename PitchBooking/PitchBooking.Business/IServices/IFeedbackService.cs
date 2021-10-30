using PagedList;
using PitchBooking.Business.Requests.FeedbackRequest;
using PitchBooking.Business.Requests.PitchRequest;
using PitchBooking.Business.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.IServices
{
    public interface IFeedbackService
    {
        Task<FeedBackModel> CreateAdvisory(CreateFeedbackRequest request);
        IEnumerable<FeedBackModel> GetAllAdvisory(FeedBackModel filter);
    }
}
