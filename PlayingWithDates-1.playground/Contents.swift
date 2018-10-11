//: Playground - noun: a place where people can play

import UIKit

//******************************************************************************
// Playing with Date in swift playground
// author: liuyubobobo
// This swift playground is based on swift 2.1.1 on Xcode 7.2
// The content of this playground contains:
//******************************************************************************
//** PART I : Using NSDate and NSDateFormatter
// - Create a NSDate object
// - Create a NSDateFormatter object
// - Use dateStyle property for NSDateFormatter to show predefined date format
// - Given an NSLocale object to locale property of NSDateFormatter
//   to show locale-related date format.
//   - I use China locale in this example because I'm a Chinese:)
// - Given an date specifier string to dateFormat property of NSDateFormatter
//   to show custom date format
// - Use NSDateFormatter's dateFromString method
//   to convert a date string to an NSDate object
//******************************************************************************
// The contents are an implementation of http://appcoda.com 's tutorial
// - Refer: http://www.appcoda.com/nsdate/
//******************************************************************************


/*********************************************/
/* PART I : Using NSDate and NSDateFormatter */
/*********************************************/

/*****************************/
/* Get current NSDate object */
/*****************************/
let currentDate = Date()

/**********************************/
/* Create a NSDateFormatter object*/
/**********************************/
let dateFormatter = DateFormatter()

/**********************************************/
/* See different date styles of dateFormatter */
/**********************************************/
// Full Style
dateFormatter.dateStyle = DateFormatter.Style.full
var convertedDate = dateFormatter.string(from: currentDate)

// Long Style
dateFormatter.dateStyle = DateFormatter.Style.long
convertedDate = dateFormatter.string(from: currentDate)

// Medium Style
dateFormatter.dateStyle = DateFormatter.Style.medium
convertedDate = dateFormatter.string(from: currentDate)

// Short Style
dateFormatter.dateStyle = DateFormatter.Style.short
convertedDate = dateFormatter.string(from: currentDate)

/********************************************/
/* Set the locale property of dateFormatter */
/********************************************/
// Create a 'zh_CN' NSLocale object
let cnLocale = NSLocale(localeIdentifier: "zh_CN")
// Set the Chinese locale to data formatter
dateFormatter.locale = cnLocale as Locale!

// See different date styles of dateFormatter on China locale
dateFormatter.dateStyle = DateFormatter.Style.full
convertedDate = dateFormatter.string(from: currentDate)

dateFormatter.dateStyle = DateFormatter.Style.long
convertedDate = dateFormatter.string(from: currentDate)

dateFormatter.dateStyle = DateFormatter.Style.medium
convertedDate = dateFormatter.string(from: currentDate)

dateFormatter.dateStyle = DateFormatter.Style.short
// Pay attention that the order of year, month and day changed 
// on Chinese locale compared with US locale
convertedDate = dateFormatter.string(from: currentDate)

// go back to US locale
dateFormatter.locale = NSLocale.current

/**********************************************/
/* Using specifier to show custom date format */
/**********************************************/

// EEEE: The full name of the day (e.g. Monday). Use 1-3 letters for the abbreviated representation of the day name.
// MMMM: The full name of the month (e.g. October). Use 1-3 letters for the abbreviated representation of the month name.
// dd: The day number in the month (e.g. 09 or 15).
// yyyy: The year with four digits (e.g. 2015)
// HH: The hour representation with two digits (e.g. 08 or 19).
// mm: The minutes representation with two digits (e.g. 05 or 54).
// ss: The seconds representation with two digits.
// zzz: The timezone presented with three letters (e.g. GMT)
// GGG: BC or AD.
// The full reference on the date format specifier:
// http://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns

dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
convertedDate = dateFormatter.string(from: currentDate)

dateFormatter.dateFormat = "HH:mm:ss"
convertedDate = dateFormatter.string(from: currentDate)

/*********************************************/
/* Convert a date string to an NSDate object */
/*********************************************/
var dateAsString = "24-12-2015 23:59"
dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
var newDate = dateFormatter.date(from: dateAsString)

dateAsString = "Thu, 08 Oct 2015 09:22:33 GMT"
dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
// Note the 09:22:33 get changed by using the timezone string
newDate = dateFormatter.date(from: dateAsString)
