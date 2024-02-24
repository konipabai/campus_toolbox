import { Entity, Column, PrimaryGeneratedColumn } from "typeorm"

@Entity()
export class resultFault {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 255, nullable: false })
    account: string;             // 账号

    @Column({ type: 'varchar', length: 255, nullable: false })
    item: string;                // 物品

    @Column({ type: 'varchar', length: 255, nullable: false })
    location: string;            // 地点

    @Column({ type: 'varchar', length: 255, nullable: false })
    number: string;              // 房间号

    @Column({ type: 'varchar', length: 255, nullable: false })
    contact: string;             // 联系方式

    @Column({ type: 'varchar', length: 255, nullable: false })
    description: string;         // 描述

    @Column({ type: 'date', nullable: false })
    date: Date;                  // 申请的时间

    @Column({ type: 'varchar', length: 255, nullable: false })
    state: string;               // 是否已经处理完成
}