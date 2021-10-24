using AutoMapper;
using PitchBooking.Business.IServices;
using PitchBooking.Business.ViewModel;
using PitchBooking.Data.IRepositories;
using PitchBooking.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using PitchBooking.Business.Enum;
using PitchBooking.Business.Requests.BookingRequest;

namespace PitchBooking.Business.Services
{
    public class BookingService : IBookingService
    {
        private IGenericRepository<Booking> _genericRepository;
        private IMapper _mapper;

        public BookingService(IGenericRepository<Booking> genericRepository, IMapper mapper)
        {
            _genericRepository = genericRepository;
            _mapper = mapper;
        }

        public async Task<bool> CancelBooking(CancelBookingRequest request)
        {
            var booking = await _genericRepository.FindAsync(b => b.Id == request.Id && b.Status == (int)BookingStatus.Booked);
            if (booking == null) return false;

            booking.CancelReason = request.CancelReason;
            booking.Status = (int)BookingStatus.Cancel;
            await _genericRepository.UpdateAsync(booking);
            return true;
        }

        public async Task<IEnumerable<BookingModel>> GetListBookedByCustomerID(int id)
        {
            var bookedList = await _genericRepository.GetAllByIQueryable()
                .Include(b => b.SubPitch.Pitch).Include(b => b.SubPitch)
                .Where(b => b.CustomerId == id && b.Status == (int)BookingStatus.Booked).ToListAsync();
            return _mapper.Map<IEnumerable<BookingModel>>(bookedList);
        }
    }
}
