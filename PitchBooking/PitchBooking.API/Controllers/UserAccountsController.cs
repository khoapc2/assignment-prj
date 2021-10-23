using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PitchBooking.Business.IServices;
using PitchBooking.Business.Requests.UserAccountRequest;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PitchBooking.API.Controllers
{
    [Route("api/v1/user-accounts")]
    [ApiController]
    public class UserAccountsController : ControllerBase
    {
        private readonly IUserAccountService _service;

        public UserAccountsController(IUserAccountService service)
        {
            _service = service;
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> RegisterAccount([FromBody] UserAccountRequest request)
        {
            try
            {
                var isRegister = await _service.RegisterAccount(request);
                if (isRegister) return Ok();
                return BadRequest("Username is duplicated!");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
