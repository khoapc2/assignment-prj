using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PitchBooking.Business.IServices;
using PitchBooking.Business.Requests.PitchRequest;
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
            var listAdvisoryModel = _pitchService.GetAllAdvisory(filter);
            return Ok(listAdvisoryModel);
        }

        [HttpPost]
        public async Task<IActionResult> CreateAdvisory([FromBody] CreatePitchRequest request)
        {
            var AdvisoryModel = await _pitchService.CreateAdvisory(request);
            return Ok(AdvisoryModel);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateAdvisory(int id, [FromBody] UpdatePitchRequest request)
        {
            var AdvisoryModel = await _pitchService.UpdateAdvisory(id, request);
            if (AdvisoryModel == null)
                return BadRequest();
            return Ok(AdvisoryModel);
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteAdvisory(int id)
        {
            var rs = await _pitchService.DeleteAdvisory(id);
            if (rs == false)
                return BadRequest();
            return Ok();
        }

        [HttpGet("get_highest_rates")]
        public IActionResult GetHighestRatePitch()
        {
            var listAdvisoryModel = _pitchService.getHighestRates();
            return Ok(listAdvisoryModel);
        }
    }
}
