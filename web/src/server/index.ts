import axios from 'axios'
import { reserveClassroomType, searchClassroomType } from '../types/classroom'
import { postLostFoundType } from '../types/lostFound'

axios.defaults.baseURL = "/api"

export const getClassroom = (data: searchClassroomType) => axios.get('/classroom', { params: data }).then(res => res.data)

export const addClassroom = (data: reserveClassroomType) => axios.post('/classroom', data).then(res => res.data)

export const getLostFound = () => axios.get('/lostFound').then(res => res.data)

export const postLostFound = (data: postLostFoundType) => axios.post('/lostFound', data).then(res => res.data)
