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
    public class AbsencesController : ControllerBase
    {
        private readonly CorporateInfoHubContext _context;

        public AbsencesController(CorporateInfoHubContext context)
        {
            _context = context;
        }

        // GET: api/Absences
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Absence>>> GetAbsences()
        {
            return await _context.Absences.ToListAsync();
        }

        // GET: api/AbsencesDetails
        [HttpGet("/api/AbsencesDetails")]
        public async Task<ActionResult<IEnumerable<Absence>>> GetAbsencesDetails()
        {
            return await _context.Absences.Include(absence => absence.Type).ToListAsync();
        }

        // GET: api/Absences/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Absence>> GetAbsence(long id)
        {
            var absence = await _context.Absences.FindAsync(id);

            if (absence == null)
            {
                return NotFound();
            }

            return absence;
        }

        // GET: api/AbsencesDetails/5
        [HttpGet("/api/AbsencesDetails/{id}")]
        public async Task<ActionResult<Absence>> GetAbsenceDetails(long id)
        {
            var absence = await _context.Absences.Where(absence=>absence.Id == id)
                .Include(absence => absence.Type).FirstOrDefaultAsync();

            if (absence == null)
            {
                return NotFound();
            }

            return absence;
        }

        // PUT: api/Absences/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAbsence(long id, Absence absence)
        {
            if (id != absence.Id)
            {
                return BadRequest();
            }

            _context.Entry(absence).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AbsenceExists(id))
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

        // POST: api/Absences
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Absence>> PostAbsence(Absence absence)
        {
            _context.Absences.Add(absence);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAbsence", new { id = absence.Id }, absence);
        }

        // DELETE: api/Absences/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAbsence(long id)
        {
            var absence = await _context.Absences.FindAsync(id);
            if (absence == null)
            {
                return NotFound();
            }

            _context.Absences.Remove(absence);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool AbsenceExists(long id)
        {
            return _context.Absences.Any(e => e.Id == id);
        }
    }
}
