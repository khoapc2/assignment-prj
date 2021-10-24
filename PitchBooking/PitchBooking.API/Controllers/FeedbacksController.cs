using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PitchBooking.Business.IServices;
using PitchBooking.Business.Requests.FeedbackRequest;
using PitchBooking.Business.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PitchBooking.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FeedbacksController : ControllerBase
    {
        private readonly IFeedbackService _pitchService;

        public FeedbacksController(IFeedbackService pitchService)
        {
            _pitchService = pitchService;
        }

        [HttpPost]
        public async Task<IActionResult> CreateAdvisory([FromBody] CreateFeedbackRequest request)
        {
            var AdvisoryModel = await _pitchService.CreateAdvisory(request);
            return Ok(AdvisoryModel);
        }

        [HttpGet]
        public IActionResult GetAllAdvisory([FromQuery] FeedBackModel filter, 
          int pageIndex = 1, int pageSize = 1)
        {
            var listAdvisoryModel = _pitchService.GetAllAdvisory(filter, pageIndex, pageSize);
            return Ok(listAdvisoryModel);
        }
    }
}
