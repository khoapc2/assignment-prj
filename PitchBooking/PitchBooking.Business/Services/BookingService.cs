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

        public async Task<IEnumerable<BookingModel>> GetListBookedByCustomerID(int id)
        {
            var bookedList = await _genericRepository.GetAllByIQueryable()
                .Include(b => b.SubPitch.Pitch).Include(b => b.SubPitch)
                .Where(b => b.CustomerId == id && b.Status == (int)BookingStatus.Booked).ToListAsync();
            return _mapper.Map<IEnumerable<BookingModel>>(bookedList);
        }
    }
}
