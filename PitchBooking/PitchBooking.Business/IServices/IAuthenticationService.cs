using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.IServices
{
    public interface IAuthenticationService
    {
        public string GenerateJSONWebToken(string id, string username, string role);
    }
}
