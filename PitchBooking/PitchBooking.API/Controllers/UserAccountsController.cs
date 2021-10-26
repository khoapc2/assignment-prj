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
        [HttpPost("register")]
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

        [AllowAnonymous]
        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequest request)
        {
            try
            {
                var authentication = await _service.Login(request);
                if (authentication != null) return Ok(authentication);
                return BadRequest();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //[Authorize]
        [HttpPut]
        public async Task<IActionResult> UpdateProfile([FromBody] UpdateAccountRequest request)
        {
            try
            {
                var profile = await _service.UpdateProfile(request);
                if (profile != null) return Ok(profile);
                return BadRequest();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //[Authorize]
        [HttpGet("{id}")]
        public async Task<IActionResult> GetProfileByID(int id)
        {
            try
            {
                var profile = await _service.GetProfileByID(id);
                return Ok(profile);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [AllowAnonymous]
        [HttpGet("check/{username}")]
        public async Task<IActionResult> CheckUsername(string username)
        {
            try
            {
                var isExisted = await _service.CheckUsername(username);
                if (isExisted) return Ok();
                return BadRequest();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [AllowAnonymous]
        [HttpPut("change-password")]
        public async Task<IActionResult> ChangePassword([FromBody] ChangePasswordRequest request)
        {
            try
            {
                var isChange = await _service.ChangePassword(request);
                if (isChange) return Ok();
                return BadRequest();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
