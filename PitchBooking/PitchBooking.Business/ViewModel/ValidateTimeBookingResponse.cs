using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.ViewModel
{
    public class ValidateTimeBookingResponse
    {
        public string TimeStartError { get; set; }
        public string TimeEndError { get; set; }
    }
}
