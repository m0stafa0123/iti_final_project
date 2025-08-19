class AppValidators {
  static String? validateTasks(String? value) {
    if (value == null || value.isEmpty) {
      return 'this field  is required';
    }
    else if (value.length > 50) {
      return 'this field  must be at most 50 characters long';
    }
    return null;
  }
  
}
