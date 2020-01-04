using GreenslateChallenge.Models;
using Microsoft.EntityFrameworkCore;

namespace GreenslateChallenge.Data
{
    public class ProjectsContext : Microsoft.EntityFrameworkCore.DbContext
    {
        public ProjectsContext(DbContextOptions<ProjectsContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

        }

        public DbSet<User> User { get; set; }
        public DbSet<Project> Project { get; set; }
        public DbSet<UserProject> UserProject { get; set; }

    }
}
