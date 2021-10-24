using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PitchBooking.Business.IServices;
using PitchBooking.Business.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PitchBooking.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PitchesController : ControllerBase
    {
        private readonly IPitchService _pitchService;

        public PitchesController(IPitchService pitchService)
        {
            _pitchService = pitchService;
        }

        [HttpGet]
        public IActionResult GetAllAdvisory([FromQuery] PitchModel filter,
            int pageIndex = 1, int pageSize = 1)
        {
            var listAdvisoryModel = _pitchService.GetAllAdvisory(filter, pageIndex, pageSize);
            return Ok(listAdvisoryModel);
        }
    }
}
