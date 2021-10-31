using PagedList;
using PitchBooking.Business.Requests.SubPitchRequest;
using PitchBooking.Business.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.IServices
{
    public interface ISubPitchService
    {
        IEnumerable<SubPitchModel> GetAllSubPitches(SubPitchCreate filter);
        SubPitchModel GetSubPitchById(int id);
        Task<SubPitchModel> CreateSubPitch(SubPitchCreate SubPitchRequest);
        Task<SubPitchModel> UpdateSubPitch(SubPitchUpdate SubPitchUpdate);
        Task<bool> DeleteSubPitch(int id);
        Task<ICollection<SubPitchModel>> GetSubPitchesByPitchId(int pitchId);
    }
}
