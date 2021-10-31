using Microsoft.AspNetCore.Mvc;
using PitchBooking.Business.IServices;
using PitchBooking.Business.Requests.SubPitchRequest;
using PitchBooking.Business.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PitchBooking.API.Controllers
{
    [Route("api/v1/subPitches")]
    [ApiController]
    public class SubPitchesController : Controller
    {
            private readonly ISubPitchService _service;
            public SubPitchesController(ISubPitchService service)
            {
                _service = service;
            }

            //GET api/subPitchs
            [HttpGet]
            public ActionResult<IEnumerable<SubPitchModel>> GetAllSubPitchs([FromQuery] SubPitchCreate filter)
            {
                return Ok(_service.GetAllSubPitches(filter));
            }

            //GET api/subPitchs/{id}
            [HttpGet("{id}", Name = "GetSubPitchById")]
            public ActionResult<SubPitchModel> GetSubPitchById(int id)
            {
                var subPitchModel = _service.GetSubPitchById(id);
                if (subPitchModel == null)
                {
                    return BadRequest();
                }
                return Ok(subPitchModel);
            }

            //POST api/subPitchs
            [HttpPost]
            public async Task<ActionResult<SubPitchModel>> CreateSubPitch(SubPitchCreate subPitchRequest)
            {
                var subPitchModel = await _service.CreateSubPitch(subPitchRequest);
                if (subPitchModel != null)
                {
                    return CreatedAtRoute(nameof(GetSubPitchById)
                        , new { Id = subPitchModel.Id }, subPitchModel);
                }
                return BadRequest();
            }

            //PUT api/subPitchs/{id}
            [HttpPut("update-subPitch")]
            public async Task<ActionResult<SubPitchModel>> UpdateSubPitch(SubPitchUpdate subPitchUpdate)
            {
                var subPitchModel = await _service.UpdateSubPitch(subPitchUpdate);
                if (subPitchModel != null)
                {
                    return Ok(subPitchModel);
                }
                return BadRequest();
            }

            //DELETE api/subPitchs/{id}
            [HttpDelete("{id}")]
            public async Task<ActionResult> DeleteSubPitch(int id)
            {
                bool deleteStatus = await _service.DeleteSubPitch(id);
                if (deleteStatus)
                {
                    return Ok();
                }
                return BadRequest();
            }

            
    }
}
