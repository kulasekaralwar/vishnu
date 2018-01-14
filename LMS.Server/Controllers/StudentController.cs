using LMS.Model;
using LMS.Service;
using System.Web.Http;

namespace LMS.Server.Controllers
{
    public class StudentController : ApiController
    {

        public IHttpActionResult Post(Student student)
        {
            StudentService studentService = new StudentService();
            var Add = studentService.Add(student);
            return this.Ok(Add);
        }
    }
}
