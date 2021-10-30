using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.ViewModel
{
    public class FeedBackModel
    {
        public int? Id { get; set; }
        public int? CustomerId { get; set; }
        public int? PitchId { get; set; }
        public string Content { get; set; }
        public int? Rating { get; set; }
        public int? BookingId { get; set; }

        public string? CustomerName { get; set; }
    }
}
