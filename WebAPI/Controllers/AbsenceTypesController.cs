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
    public class AbsenceTypesController : ControllerBase
    {
        private readonly CorporateInfoHubContext _context;

        public AbsenceTypesController(CorporateInfoHubContext context)
        {
            _context = context;
        }

        // GET: api/AbsenceTypes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<AbsenceType>>> GetAbsenceTypes()
        {
            return await _context.AbsenceTypes.ToListAsync();
        }

        // GET: api/AbsenceTypes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<AbsenceType>> GetAbsenceType(short id)
        {
            var absenceType = await _context.AbsenceTypes.FindAsync(id);

            if (absenceType == null)
            {
                return NotFound();
            }

            return absenceType;
        }

        // PUT: api/AbsenceTypes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAbsenceType(short id, AbsenceType absenceType)
        {
            if (id != absenceType.Id)
            {
                return BadRequest();
            }

            _context.Entry(absenceType).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AbsenceTypeExists(id))
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

        // POST: api/AbsenceTypes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<AbsenceType>> PostAbsenceType(AbsenceType absenceType)
        {
            _context.AbsenceTypes.Add(absenceType);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAbsenceType", new { id = absenceType.Id }, absenceType);
        }

        // DELETE: api/AbsenceTypes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAbsenceType(short id)
        {
            var absenceType = await _context.AbsenceTypes.FindAsync(id);
            if (absenceType == null)
            {
                return NotFound();
            }

            _context.AbsenceTypes.Remove(absenceType);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool AbsenceTypeExists(short id)
        {
            return _context.AbsenceTypes.Any(e => e.Id == id);
        }
    }
}
