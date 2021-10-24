using PitchBooking.Business.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.IServices
{
    public interface IBookingService
    {
        public Task<IEnumerable<BookingModel>> GetListBookedByCustomerID(int id);
    }
}
