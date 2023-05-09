export class CreateClassroomDto {
    account: string;            // 账号
    name: string;               // 用户名
    reason: string;             // 申请理由
    time_frame: string;         // 申请的时间范围
    classroom_number: string;   // 申请的教室号
    state: string;              // 是否申请成功
}