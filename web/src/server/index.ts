import axios from 'axios'
import { reserveClassroomType, searchClassroomType } from '../types/classroom'
import { getAccountLostFoundType, postLostFoundType, deleteLostFoundType } from '../types/lostFound'
import { getSeatType, postSeatType } from '../types/seat'
import { getSportsType, postSportsType } from '../types/sports'
import { getAccountFaultType, postFaultType, deleteFaultType } from '../types/fault'
import { getNewsType } from '../types/news'
import { getRecruitmentType } from '../types/recruitment'
import { updateClassroomRecordsType, updateSeatRecordsType, updateSportsRecordsType, getRecordsType, deleteRecordsType } from '../types/records'
import { deleteOrderRecruitmentType, getOrderType, postOrderRecruitmentType, updateOrderClassroomType, updateOrderFaultType, updateOrderLFType } from '../types/order'
import { getLoginType } from '../types/login'

axios.defaults.baseURL = "/api"

export const getClassroom = (data: searchClassroomType) => axios.get('/classroom', { params: data }).then(res => res.data)

export const postClassroom = (data: reserveClassroomType) => axios.post('/classroom', data).then(res => res.data)

export const getLostFound = (data?: getAccountLostFoundType) => axios.get('/lostFound', { params: data }).then(res => res.data)

export const postLostFound = (data: postLostFoundType) => axios.post('/lostFound', data).then(res => res.data)

export const updateLostFound = (data: postLostFoundType) => axios.patch('/lostFound', data).then(res => res.data)

export const deleteLostFound = (data: deleteLostFoundType) => axios.delete('/lostFound', { params: data }).then(res => res.data)

export const getSeat = (data: getSeatType) => axios.get('/seat', { params: data }).then(res => res.data)

export const postSeat = (data: postSeatType) => axios.post('/seat', data).then(res => res.data)

export const getSports = (data: getSportsType) => axios.get('/sports', { params: data }).then(res => res.data)

export const postSports = (data: postSportsType) => axios.post('/sports', data).then(res => res.data)

export const getFault = (data: getAccountFaultType) => axios.get('/fault', { params: data }).then(res => res.data)

export const postFault = (data: postFaultType) => axios.post('/fault', data).then(res => res.data)

export const updateFault = (data: postFaultType) => axios.patch('/fault', data).then(res => res.data)

export const deleteFault = (data: deleteFaultType) => axios.delete('/fault', { params: data }).then(res => res.data)

export const getNews = (data: getNewsType) => axios.get('/news', { params: data }).then(res => res.data)

export const getRecruitment = (data: getRecruitmentType) => axios.get('/recruitment', { params: data }).then(res => res.data)

export const getRecords = (data: getRecordsType) => axios.get('/records', { params: data }).then(res => res.data)

// export const updateRecords = (data: updateClassroomRecordsType | updateSeatRecordsType | updateSportsRecordsType) => axios.patch('/records', data).then(res => res.data)

export const deleteRecords = (data: deleteRecordsType) => axios.delete('/records', { params: data }).then(res => res.data)

export const getOrder = (data: getOrderType) => axios.get('/administrator', { params: data }).then(res => res.data)

export const postOrder = (data: postOrderRecruitmentType) => axios.post('/administrator', data).then(res => res.data)

export const updateOrder = (data: updateOrderClassroomType | updateOrderFaultType | updateOrderLFType) => axios.patch('/administrator', data).then(res => res.data)

export const deleteOrder = (data: deleteOrderRecruitmentType) => axios.delete('/administrator', { params: data }).then(res => res.data)

export const getLogin = (data: getLoginType) => axios.get('/user', { params: data }).then(res => res.data)
