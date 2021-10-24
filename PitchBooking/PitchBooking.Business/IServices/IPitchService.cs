using PagedList;
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
        IPagedList<PitchModel> GetAllAdvisory(PitchModel filter, int pageIndex,
           int pageSize);
    }
}
