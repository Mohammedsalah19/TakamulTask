using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TakamulTaskMohammedSalah.DAL;

namespace TakamulTaskMohammedSalah.Controllers
{
    public class HRController : Controller
    {
        private HREntities _db = new HREntities();

        #region Department

        // GET: HR List
        public ActionResult DepartmentIndex()
        {
            var model = _db.Departments.ToList();
            return View(model);
        }
        //add action 
        [HttpGet]
        public ActionResult AddDepartment()
        {
             return View();
        }
        [HttpPost]
        public ActionResult AddDepartment(Department model)
        {

            if (ModelState.IsValid)
            {                
                //stored calling

                _db.InsertDepartment(model.D_Name);
                return RedirectToAction("DepartmentIndex");

            }
            return View();
        }
        // edit action
        [HttpGet]
        public ActionResult EditDepartMent(int?D_ID)
        {
            if (D_ID == null)
            {
                return HttpNotFound();
            }

            var model = _db.Departments.Find(D_ID);
            if (model == null)
            {
                return HttpNotFound();

            }
            return View(model);
        }
        [HttpPost]
        public ActionResult EditDepartMent(Department model)
        {

            if (ModelState.IsValid)
            {
                //stored calling
                _db.UpdateDepart(model.D_Name, model.D_ID);
                return RedirectToAction("DepartmentIndex");

            }
            return View();
        }

        //delete action
        public ActionResult DeleteDepartMent(int? D_ID)
        {
            if (D_ID == null)
            {
                return HttpNotFound();
            }
            Department department = _db.Departments.Find(D_ID);
            if (department == null)
            {
                return HttpNotFound();
            }
            return View(department);
        }

        [HttpPost, ActionName("DeleteDepartMent")]

        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int D_ID)
        {
            //stored calling

            _db.DeleteDepartment(D_ID);
            return RedirectToAction("DepartmentIndex");

        }

        #endregion

       public ActionResult Employeeindex()
        {
            var model = _db.Employees.ToList();
            return View(model);
        }

        [HttpGet]
        public ActionResult AddEmployee()
        {
            ViewBag.D_ID = new SelectList(_db.Departments.ToList(), "D_ID", "D_Name");

            return View();
        }
        [HttpPost]
        public ActionResult AddEmployee(Employee model)
        {
            _db.InsertEmployee(model.Em_Name, model.D_ID);
            return RedirectToAction("Employeeindex");
        }

        // edit action
        [HttpGet]
        public ActionResult EditEmployee(int? Em_ID)
        {
            if (Em_ID == null)
            {
                return HttpNotFound();
            }

            var model = _db.Employees.Find(Em_ID);
            ViewBag.D_ID = new SelectList(_db.Departments.ToList(), "D_ID", "D_Name",model.D_ID);

            if (model == null)
            {
                return HttpNotFound();

            }
            return View(model);
        }
        [HttpPost]
        public ActionResult EditEmployee(Employee model)
        {

            if (ModelState.IsValid)
            {
                //stored calling
                _db.UpdateEmployee(model.Em_Name, model.D_ID, model.Em_ID);
                return RedirectToAction("Employeeindex");

            }
            return View();
        }


        //delete action
        public ActionResult DeleteEmployee(int? Em_ID)
        {
            if (Em_ID == null)
            {
                return HttpNotFound();
            }
            Employee emp = _db.Employees.Find(Em_ID);
            if (emp == null)
            {
                return HttpNotFound();
            }
            return View(emp);
        }

        [HttpPost, ActionName("DeleteEmployee")]

        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmedEMp(int Em_ID)
        {
            //stored calling

            _db.DeleteEmployee(Em_ID);
            return RedirectToAction("Employeeindex");

        }

    }
}