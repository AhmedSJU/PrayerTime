//
//  Result.swift
//  PrayerTime
//
//  Created by Sheikh Ahmed on 09/05/2020.
//  Copyright © 2020 Sheikh Ahmed. All rights reserved.
//
enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
