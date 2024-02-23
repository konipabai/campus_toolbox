import axios from 'axios'
import { reserveClassroomType, searchClassroomType } from '../types/classroom'
import { getAccountLostFoundType, postLostFoundType, deleteLostFoundType } from '../types/lostFound'
import { getSeatType, postSeatType } from '../types/seat'
import { getSportsType, postSportsType } from '../types/sports'
import { getAccountFaultType, postFaultType, deleteFaultType } from '../types/fault'
import { getNewsType } from '../types/news'
import { findRecruitmentType, getRecruitmentType } from '../types/recruitment'
import { updateClassroomRecordsType, updateSeatRecordsType, updateSportsRecordsType, getRecordsType, deleteRecordsType } from '../types/records'
import { getOrderReserveType, updateOrderReserveType } from '../types/order'

axios.defaults.baseURL = "/api"

export const getClassroom = (data: searchClassroomType) => axios.get('/classroom', { params: data }).then(res => res.data)

export const postClassroom = (data: reserveClassroomType) => axios.post('/classroom', data).then(res => res.data)

export const getLostFound = (data?: getAccountLostFoundType) => axios.get('/lostFound', { params: data }).then(res => res.data)

export const postLostFound = (data: postLostFoundType) => axios.post('/lostFound', data).then(res => res.data)

export const updateLostFound = (data: postLostFoundType) => axios.patch(`/lostFound/${data.id}`, data).then(res => res.data)

export const deleteLostFound = (data: deleteLostFoundType) => axios.delete(`/lostFound/${data.id}`).then(res => res.data)

export const getSeat = (data: getSeatType) => axios.get('/seat', { params: data }).then(res => res.data)

export const postSeat = (data: postSeatType) => axios.post('/seat', data).then(res => res.data)

export const getSports = (data: getSportsType) => axios.get('/sports', { params: data }).then(res => res.data)

export const postSports = (data: postSportsType) => axios.post('/sports', data).then(res => res.data)

export const getFault = (data: getAccountFaultType) => axios.get('/fault', { params: data }).then(res => res.data)

export const postFault = (data: postFaultType) => axios.post('/fault', data).then(res => res.data)

export const updateFault = (data: postFaultType) => axios.patch(`/fault/${data.id}`, data).then(res => res.data)

export const deleteFault = (data: deleteFaultType) => axios.delete(`/fault/${data.id}`).then(res => res.data)

export const getNews = (data: getNewsType) => axios.get('/news', { params: data }).then(res => res.data)

export const getRecruitment = (data: getRecruitmentType) => axios.get('/recruitment', { params: data }).then(res => res.data)

export const postRecruitment = (data: findRecruitmentType) => axios.post('/recruitment', data).then(res => res.data)

export const getRecords = (data: getRecordsType) => axios.get('/records', { params: data }).then(res => res.data)

// export const updateRecords = (data: updateClassroomRecordsType | updateSeatRecordsType | updateSportsRecordsType) => axios.patch('/records', data).then(res => res.data)

export const deleteRecords = (data: deleteRecordsType) => axios.delete('/records', { params: data }).then(res => res.data)

export const getOrder = (data: getOrderReserveType) => axios.get('/administrator', { params: data }).then(res => res.data)

export const updateOrder = (data: updateOrderReserveType) => axios.patch('/administrator', data).then(res => res.data)
