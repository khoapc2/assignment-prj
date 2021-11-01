﻿using AutoMapper;
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

        public async Task<BookingModel> CreateBooking(CreateBookingRequest request)
        {
            var booking = _mapper.Map<Booking>(request);
            await _genericRepository.InsertAsync(booking);
            await _genericRepository.SaveAsync();
            return await GetBookingByID(booking.Id);
        }

        public async Task<IEnumerable<BookingModel>> GetAllBookingByOwnerID(int id)
        {
            var bookings = await _genericRepository.GetAllByIQueryable()
                 .Include(b => b.SubPitch.Pitch).Include(b => b.SubPitch).Include(b => b.Customer)
                 .Where(b => b.SubPitch.Pitch.PitchOwnerId == id && b.Status == 1)
                 .OrderBy(b => b.TimeStart).OrderBy(b => b.DateBooking).ToListAsync();
            return _mapper.Map<IEnumerable<BookingModel>>(bookings);
        }

        public async Task<BookingModel> GetBookingByID(int id)
        {
            var booking = await _genericRepository.GetAllByIQueryable()
                .Include(b => b.SubPitch.Pitch).Include(b => b.SubPitch).Include(b => b.Customer)
                .Where(b => b.Id == id).FirstOrDefaultAsync();
            return _mapper.Map<BookingModel>(booking);
        }

        public async Task<IEnumerable<BookingModel>> GetListBookedByCustomerID(int id)
        {
            var bookedList = await _genericRepository.GetAllByIQueryable()
                .Include(b => b.SubPitch.Pitch).Include(b => b.SubPitch).Include(b => b.Customer)
                .Where(b => b.CustomerId == id && b.Status == (int)BookingStatus.Booked)
                .OrderBy(b => b.TimeStart).OrderBy(b => b.DateBooking).ToListAsync();

            var d = DateTime.Now;
            var expiredList = bookedList.FindAll(e => e.DateBooking <= d && e.TimeEnd?.Hours <= d.TimeOfDay.Hours && e.TimeEnd?.Minutes <= d.TimeOfDay.Minutes);
            expiredList.ForEach(a => { a.Status = 0; a.CancelReason = "Không đến sân"; });
            await _genericRepository.SaveAsync();

            var availableList = bookedList.Where(b => expiredList.All(e => e.Id != b.Id));
            return _mapper.Map<IEnumerable<BookingModel>>(availableList);
        }

        public async Task<IEnumerable<BookingModel>> GetListBookingBySubPitchID(int id)
        {
            var bookingList = await _genericRepository.GetAllByIQueryable()
                .Include(b => b.SubPitch.Pitch).Include(b => b.SubPitch).Include(b => b.Customer)
                .Where(b => b.SubPitchId == id && b.Status == (int)BookingStatus.Booked)
                .OrderBy(b => b.DateBooking).OrderBy(b => b.TimeStart).ToListAsync();
            return _mapper.Map<IEnumerable<BookingModel>>(bookingList);
        }

        public async Task<IEnumerable<BookingModel>> GetListBookingHistoryByCustomerID(int id)
        {
            var bookingList = await _genericRepository.GetAllByIQueryable()
                .Include(b => b.SubPitch.Pitch).Include(b => b.SubPitch).Include(b => b.Customer)
                .Where(b => b.CustomerId == id && b.Status != (int)BookingStatus.Booked)
                .OrderBy(b => b.TimeStart).OrderByDescending(b => b.DateBooking).ToListAsync();
            return _mapper.Map<IEnumerable<BookingModel>>(bookingList);
        }

        public async Task<bool> PaidBooking(int id)
        {
            var booking = await _genericRepository.FindAsync(b => b.Id == id && b.Status == (int)BookingStatus.Booked);
            if (booking == null) return false;

            booking.Status = (int)BookingStatus.Paid;
            await _genericRepository.UpdateAsync(booking);
            return true;
        }

        public ValidateTimeBookingResponse ValidateTimeBooking(ValidateTimeBookingRequest request)
        {
            ValidateTimeBookingResponse response = new ValidateTimeBookingResponse();
            var bookingList = _genericRepository.FindBy(b => b.DateBooking == request.DateBooking && b.Status == (int)BookingStatus.Booked && 
            b.SubPitchId == request.SubPitchId);

            response.TimeStartError = "Not Error";
            response.TimeEndError = "Not Error";

            foreach (var booking in bookingList)
            {
                if (request.TimeStart >= booking.TimeStart && request.TimeStart < booking.TimeEnd)
                {
                    response.TimeStartError = "Thời gian bắt đầu đã có người đặt";
                }
                if(request.TimeEnd > booking.TimeStart && request.TimeEnd <= booking.TimeEnd)
                {
                    response.TimeEndError = "Thời gian kết thúc đã có người đặt";
                }
                if(request.TimeStart <= booking.TimeStart && request.TimeEnd >= booking.TimeEnd)
                {
                    response.TimeStartError = "Thời gian bắt đầu đã có người đặt";
                    response.TimeEndError = "Thời gian kết thúc đã có người đặt";
                }
                if(!string.IsNullOrEmpty(response.TimeStartError) || !string.IsNullOrEmpty(response.TimeEndError))
                {
                    return response;
                }
            }

            return response;
        }
    }
}
