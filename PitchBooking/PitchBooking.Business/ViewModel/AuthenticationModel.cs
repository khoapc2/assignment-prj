using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.ViewModel
{
    public class AuthenticationModel
    {
        public string Token { get; set; }
        public string DisplayName { get; set; }
        public string Role { get; set; }
    }
}
