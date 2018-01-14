
using LMS.RequestModel;
using LMS.Service;
using System.Web.Http;
namespace LMS.Server.Controllers
{
    public class StudentQueryController : ApiController
    {

        public IHttpActionResult Post(StudentRequestModel request)
        {
            //Searching Mechanism
            StudentService service = new StudentService();
            //List<Student> students = service.Search(request);
            var students = service.Search(request);
            return this.Ok(students);
        }
    }
}
