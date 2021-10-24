using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.Requests.BookingRequest
{
    public class CancelBookingRequest
    {
        public int Id { get; set; }
        public string CancelReason { get; set; }
    }
}
