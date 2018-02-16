using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CRUDEg.Models;

namespace CRUDEg.Controllers
{
    public class EmployeesController : Controller
    {
        private MyOrgEntities db = new MyOrgEntities();

        // GET: Employees
        public ActionResult Index()
        {
            return Json(db.Employees.ToList(),JsonRequestBehavior.AllowGet);
        }

        // GET: Employees/Details/5
        public ActionResult Details(int? id)
        {
            Employee employee = db.Employees.Find(id);
            return Json(employee,JsonRequestBehavior.AllowGet);
        }

        // POST: Employees/Delete/5
        [HttpPost]
        public ActionResult Delete(int id)
        {
            Employee employee = db.Employees.Find(id);
            db.Employees.Remove(employee);
            db.SaveChanges();
            return Json(employee,JsonRequestBehavior.AllowGet);
        }


         // POST: Employees/Create
        [HttpPost]
        public ActionResult Create(Employee employee)
        {
            if (ModelState.IsValid)
            {
                db.Employees.Add(employee);
                db.SaveChanges();
                return Json(employee, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(ModelState.Keys
                    .SelectMany(k => ModelState[k].Errors)
                    .Select(m => m.ErrorMessage).ToArray(),
                    JsonRequestBehavior.AllowGet);

            }
        }

           // POST: Employees/Edit/5
        [HttpPost]
        public ActionResult Edit(Employee employee)
        {
          
                db.Entry(employee).State = EntityState.Modified;
                db.SaveChanges();
                return Json(employee, JsonRequestBehavior.AllowGet);
           
        }

        

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
