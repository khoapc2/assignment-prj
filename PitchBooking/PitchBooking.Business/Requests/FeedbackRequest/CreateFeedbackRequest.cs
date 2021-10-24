using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.Requests.FeedbackRequest
{
    public class CreateFeedbackRequest
    {
        public int? CustomerId { get; set; }
        public int? PitchId { get; set; }
        public string Content { get; set; }
        public int? Rating { get; set; }
        public int? BookingId { get; set; }
    }
}
