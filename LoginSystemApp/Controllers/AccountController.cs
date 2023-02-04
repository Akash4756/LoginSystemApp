using LoginSystemApp.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace LoginSystemApp.Controllers
{
    public class AccountController : Controller
    {
        AccountDataAccess dataAccess = new AccountDataAccess();
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(LoginModel login)
        {
            if(ModelState.IsValid)
            {
                int result=dataAccess.SignInCustomer(login);
                if(result==1)
                {
                    var claims = new List<Claim>() {
                    new Claim(ClaimTypes.NameIdentifier, Convert.ToString(login.Email)),
                        new Claim(ClaimTypes.Name, login.Email)
                        //new Claim(ClaimTypes.Role, user.Role),
                        //new Claim("FavoriteDrink", "Tea")
                };
                    //Initialize a new instance of the ClaimsIdentity with the claims and authentication scheme    
                    var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    //Initialize a new instance of the ClaimsPrincipal with ClaimsIdentity    
                    var principal = new ClaimsPrincipal(identity);
                    //SignInAsync is a Extension method for Sign in a principal for the specified scheme.    
                    await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal, new AuthenticationProperties()
                    {
                        IsPersistent = false
                    });
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.error = "Invalid Login Credentials !";
                    return View(login);
                }
            }
            return View();
        }
        public IActionResult SignUp()
        {
            return View();
        }
        [HttpPost]
        public IActionResult SignUp(SignUpModel signUp)
        {
            string message=dataAccess.SignUpCustomer(signUp);
            if(!string.IsNullOrEmpty(message))
            {
                ViewBag.message = message;
                return View();
            }
            else
            {
                ViewBag.message = "Something Wenr wrong!";
                return View();
            }
            
        }
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync();
            return RedirectToAction("Login");
        }

    }
}
