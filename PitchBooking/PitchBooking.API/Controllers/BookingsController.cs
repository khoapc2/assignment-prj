using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PitchBooking.Business.IServices;
using PitchBooking.Business.Requests.BookingRequest;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PitchBooking.API.Controllers
{
    [Route("api/v1/bookings")]
    [ApiController]
    public class BookingsController : ControllerBase
    {
        private readonly IBookingService _service;

        public BookingsController(IBookingService service)
        {
            _service = service;
        }

        //[Authorize]
        [HttpGet("booked/{id}")]
        public async Task<IActionResult> GetListBookedByCustomerID(int id)
        {
            try
            {
                var bookedList = await _service.GetListBookedByCustomerID(id);
                return Ok(bookedList);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //[Authorize]
        [HttpDelete("cancel")]
        public async Task<IActionResult> CancelBooking([FromBody] CancelBookingRequest request)
        {
            try
            {
                var isCancel = await _service.CancelBooking(request);
                if(isCancel) return Ok();
                return BadRequest();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
