using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAPI.Model;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class WorkingCalendarsController : ControllerBase
    {
        private readonly CorporateInfoHubContext _context;

        public WorkingCalendarsController(CorporateInfoHubContext context)
        {
            _context = context;
        }

        // GET: api/WorkingCalendars
        [HttpGet]
        public async Task<ActionResult<IEnumerable<WorkingCalendar>>> GetWorkingCalendars()
        {
            return await _context.WorkingCalendars.ToListAsync();
        }

        // GET: api/WorkingCalendars/5
        [HttpGet("{id}")]
        public async Task<ActionResult<WorkingCalendar>> GetWorkingCalendar(short id)
        {
            var workingCalendar = await _context.WorkingCalendars.FindAsync(id);

            if (workingCalendar == null)
            {
                return NotFound();
            }

            return workingCalendar;
        }

        // PUT: api/WorkingCalendars/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutWorkingCalendar(short id, WorkingCalendar workingCalendar)
        {
            if (id != workingCalendar.Id)
            {
                return BadRequest();
            }

            _context.Entry(workingCalendar).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!WorkingCalendarExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/WorkingCalendars
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<WorkingCalendar>> PostWorkingCalendar(WorkingCalendar workingCalendar)
        {
            _context.WorkingCalendars.Add(workingCalendar);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetWorkingCalendar", new { id = workingCalendar.Id }, workingCalendar);
        }

        // DELETE: api/WorkingCalendars/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteWorkingCalendar(short id)
        {
            var workingCalendar = await _context.WorkingCalendars.FindAsync(id);
            if (workingCalendar == null)
            {
                return NotFound();
            }

            _context.WorkingCalendars.Remove(workingCalendar);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool WorkingCalendarExists(short id)
        {
            return _context.WorkingCalendars.Any(e => e.Id == id);
        }
    }
}
