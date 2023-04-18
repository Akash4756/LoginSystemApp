
$(document).ready(function () {

    $("#btnSubmit").click(function () {

        var isValid = true
        isValid = requireTextField("Name", "your name",null,20)
        if (!isValid) { return isValid }

        isValid = requireTextField("Email", "email address","email")
        if (!isValid) { return isValid }

        isValid = requireTextField("Mobile", "Mobile number","mobile")
        if (!isValid) { return isValid }

        isValid = requireSelectField("Gender", "Gender","gender")
        if (!isValid) { return isValid }

        isValid = requireTextField("Password", "password","password")
        if (!isValid) { return isValid }

        isValid = requireTextField("Address1", "Address","address")
        if (!isValid) { return isValid }

        isValid = requireTextField("Address2", "your Address")
        if (!isValid) { return isValid }

        isValid = requireTextField("Pincode", "Pin code","pincode")
        if (!isValid) { return isValid }

        isValid = requireSelectField("Is_Active", "Choose One")
        if (!isValid) { return isValid }

        console.log(isValid)
    })

$("#txtName").keyup(function () {
    isValid = requireTextField("Name", "name",null, 20)
        if (!isValid) { return isValid }
})

$("#txtEmail").keyup(function () {
    isValid = requireTextField("Email", "email address","email")
    if (!isValid) { return isValid }
})

$("#txtMobile").keyup(function () {
    isValid = requireTextField("Mobile", "Mobile number","mobile")
    if (!isValid) { return isValid }
})

$("#ddlGender").change(function () {
    isValid = requireSelectField("Gender", "Gender","gender")
    if (!isValid) { return isValid }
})

$("#txtPassword").keyup(function () {
    isValid = requireTextField("Password", "password","password")
    if (!isValid) { return isValid }
})

$("#txtAddress1").keyup(function () {
    isValid = requireTextField("Address1", "Address","address")
    if (!isValid) { return isValid }
})

$("#txtAddress2").keyup(function () {
    isValid = requireTextField("Address2", "Address")
    if (!isValid) { return isValid }
})

$("#txtPincode").keyup(function () {
    isValid = requireTextField("Pincode", "Pin code", "pincode")
    if (!isValid) { return isValid }
})

$("#ddlIs_Active").change(function () {
    isValid = requireSelectField("Is_Active", "one")
    if (!isValid) { return isValid }
})
})




