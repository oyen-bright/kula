mixin ValidationMixin {
  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  String? validatePasswordCreateAccount(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for at least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for at least one digit
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }

    // Check for at least one symbol
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one symbol';
    }

    return null; // Password is valid
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r'^\+?234[789][01]\d{8}$').hasMatch(value)) {
      return 'Enter a valid Nigerian phone number';
    }
    return null;
  }

  String? validateNigerianPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone number is required';
    }
    // Remove any whitespace from the phone number
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\s+\b|\b\s'), '');

    // Check if the phone number contains only digits
    if (!RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
      return 'Phone number must contain only digits';
    }

    if (phoneNumber.length != 10) {
      return 'Phone number must have 10 digits';
    }

    // // Check if the phone number starts with a valid Nigerian prefix
    // final validPrefixes = ['080', '081', '090', '070', '071', '090', '091'];
    // if (!validPrefixes.any((prefix) => phoneNumber.startsWith(prefix))) {
    //   return 'Invalid Nigerian phone number prefix';
    // }

    // If all conditions are met, return null (no error)
    return null;
  }
}
