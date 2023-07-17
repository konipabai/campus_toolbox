export class CreateClassroomDto {
    account: string;            // 账号
    name: string;               // 用户名
    reason: string;             // 申请理由
    date: string;               // 申请的日期
    time: string;               // 申请的时间
    classroomNumber: string;    // 申请的教室号
    state: string;              // 是否申请成功
}