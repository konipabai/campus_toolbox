import axios from 'axios'

axios.defaults.baseURL = "/api"

export const getClassroom = (data: any) => axios.get('/classroom', { params: data }).then(res => res.data)

export const addClassroom = (data: any) => axios.post('/classroom', data).then(res => res.data)
