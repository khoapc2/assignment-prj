using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.Requests.UserAccountRequest
{
    public class ChangePasswordRequest
    {
        public string Username { get; set; }
        public string NewPassword { get; set; }
    }
}
