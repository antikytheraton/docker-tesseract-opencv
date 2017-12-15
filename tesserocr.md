# TesserOCR installation

### /usr/include/tesseract/unichar.h

* Line 164 => 
```c++
string -> std:string
```

### /usr/include/tesseract/unicharset.h

* Line 241
```c++
static string -> static std::string
```

* Line 244
* Line 265


#### /usr/include/c++/5/bits/stringfwd.h
* Line 74
```c++
string -> std::__cxx11::string
```