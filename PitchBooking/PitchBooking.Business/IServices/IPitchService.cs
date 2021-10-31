using PagedList;
using PitchBooking.Business.Requests.PitchRequest;
using PitchBooking.Business.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.IServices
{
    public interface IPitchService
    {
        IEnumerable<PitchModel> GetAllAdvisory(PitchModel filter);
        Task<PitchModel> CreateAdvisory(CreatePitchRequest request);
        Task<PitchModel> UpdateAdvisory(int id, UpdatePitchRequest request);
        Task<bool> DeleteAdvisory(int id);
        IEnumerable<PitchModel>  getHighestRates();
        IEnumerable<PitchModel> getRecommendPitch();

        Task<PitchModel> GetPitchById(int id);
        Task<bool> UpdateRatePitch(int id, double rate);

    }
}
