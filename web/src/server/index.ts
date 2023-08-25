import axios from 'axios'
import { reserveClassroomType, searchClassroomType } from '../types/classroom'
import { getAccountLostFoundType, postLostFoundType, deleteLostFoundType } from '../types/lostFound'
import { getSeatType, postSeatType } from '../types/seat'

axios.defaults.baseURL = "/api"

export const getClassroom = (data: searchClassroomType) => axios.get('/classroom', { params: data }).then(res => res.data)

export const addClassroom = (data: reserveClassroomType) => axios.post('/classroom', data).then(res => res.data)

export const getLostFound = (data?: getAccountLostFoundType) => axios.get('/lostFound', { params: data }).then(res => res.data)

export const postLostFound = (data: postLostFoundType) => axios.post('/lostFound', data).then(res => res.data)

export const updateLostFound = (data: postLostFoundType) => axios.patch(`/lostFound/${data.id}`, data).then(res => res.data)

export const deleteLostFound = (data: deleteLostFoundType) => axios.delete(`/lostFound/${data.id}`).then(res => res.data)

export const getSeat = (data: getSeatType) => axios.get('/seat', { params: data }).then(res => res.data)

export const postSeat = (data: postSeatType) => axios.post('/seat', data).then(res => res.data)
